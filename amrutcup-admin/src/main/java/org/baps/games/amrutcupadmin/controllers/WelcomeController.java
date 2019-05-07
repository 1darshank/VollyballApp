package org.baps.games.amrutcupadmin.controllers;

import org.baps.games.amrutcupadmin.domain.LiveGame;
import org.baps.games.amrutcupadmin.domain.LoginDetails;
import org.baps.games.amrutcupadmin.domain.Schedule;
import org.baps.games.amrutcupadmin.exception.LoggedOutException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.ParameterizedTypeReference;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

@Controller
public class WelcomeController {

    @Autowired
    private RestTemplate restTemplate;
    // inject via application.properties
    @Value("${admin.api.url}")
    private String ADMIN_API_BASE_URL;

    @RequestMapping("/")
    public String welcome(Map<String, Object> model, HttpSession session) {
        model.put("error", "");
        return "login";
    }

    @RequestMapping("/logout")
    public String logout(Map<String, Object> model, HttpSession session) {
        session.removeAttribute("loginDetails");
        model.put("error", "");
        return "login";
    }

    @PostMapping("/login")
    public String login(Map<String, Object> model, @RequestParam String userName, @RequestParam String password, HttpSession session) {
        final String url = ADMIN_API_BASE_URL + "/login";

        MultiValueMap<String, String> req = new LinkedMultiValueMap<String, String>();
        req.add("userName", userName);
        req.add("password", password);

        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_FORM_URLENCODED);
        HttpEntity<MultiValueMap<String, String>> request = new HttpEntity<MultiValueMap<String, String>>(req, headers);


        final ResponseEntity<LoginDetails> responseEntity = restTemplate.postForEntity(url,
                req,
                LoginDetails.class);
        if (responseEntity.getStatusCode().equals(HttpStatus.OK) && responseEntity.getBody() != null) {
            System.out.println("Login success");
            session.setAttribute("loginDetails", responseEntity.getBody());
            return "redirect:schedules";
        } else {
            model.put("error", "Login attempt failed");
            return "login";
        }
    }

    @RequestMapping("/schedules")
    public String schedules(Map<String, Object> model, HttpSession session) {
        try {
            final LoginDetails loginDetails = getLoginDetails(session);
            model.put("schedules", getSchedules(loginDetails));
        } catch (LoggedOutException e) {
            return "login";
        }
        return "schedules";
    }

    @RequestMapping("/startGame")
    public String startGame(Map<String, Object> model, @RequestParam Integer id, HttpSession session) {
        try {
            final LoginDetails loginDetails = getLoginDetails(session);
            final String url = ADMIN_API_BASE_URL + "/schedules/" + id + "/start-game";
            final ResponseEntity<LiveGame> responseEntity = restTemplate.exchange(url,
                    HttpMethod.POST,
                    new HttpEntity<String>(authHeaders(loginDetails)),
                    LiveGame.class);

            model.put("scoring", responseEntity.getBody());
            model.put("baseUrl", ADMIN_API_BASE_URL);
        } catch (LoggedOutException e) {
            return "login";
        }
        return "score";
    }

    @RequestMapping("/scoring")
    public String scoring(Map<String, Object> model, @RequestParam Integer courtId, HttpSession session) {
        try {
            final LoginDetails loginDetails = getLoginDetails(session);
            final String url = ADMIN_API_BASE_URL + "/games?_s=courtNo==" + courtId + ";status==A";
            final ResponseEntity<List<LiveGame>> responseEntity = restTemplate.exchange(url,
                    HttpMethod.GET,
                    null,
                    new ParameterizedTypeReference<List<LiveGame>>() {
                    });

            model.put("scoring", responseEntity.getBody().get(0));
        } catch (LoggedOutException e) {
            return "login";
        }
        return "score";
    }

    @RequestMapping("/finish")
    public String finishGame(Map<String, Object> model, @RequestParam Integer gameId, HttpSession session) {
        try {
            final LoginDetails loginDetails = getLoginDetails(session);
            final String url = ADMIN_API_BASE_URL + "/games/" + gameId + "/finish-game";
            restTemplate.exchange(url,
                    HttpMethod.PUT,
                    new HttpEntity<String>(authHeaders(loginDetails)),
                    String.class);

            model.put("schedules", getSchedules(loginDetails));
        } catch (LoggedOutException e) {
            return "login";
        }
        return "schedules";
    }

    @RequestMapping("/increment")
    public String increment(Map<String, Object> model, @RequestParam Integer teamId, @RequestParam Integer gameId, @RequestParam Integer courtId, HttpSession session) {
        try {
            final LoginDetails loginDetails = getLoginDetails(session);
            final String url = ADMIN_API_BASE_URL + "/games/ " + gameId + "/add-score?teamId=" + teamId;
            restTemplate.exchange(url,
                    HttpMethod.PUT,
                    new HttpEntity<String>(authHeaders(loginDetails)),
                    String.class);
        } catch (LoggedOutException e) {
            return "login";
        }
        return "redirect:scoring?courtId=" + courtId;
    }

    @RequestMapping("/decrement")
    public String decrement(Map<String, Object> model, @RequestParam Integer teamId, @RequestParam Integer gameId, @RequestParam Integer courtId, HttpSession session) {
        try {
            final LoginDetails loginDetails = getLoginDetails(session);
            final String url = ADMIN_API_BASE_URL + "/games/ " + gameId + "/undo-score?teamId=" + teamId;
            restTemplate.exchange(url,
                    HttpMethod.PUT,
                    new HttpEntity<String>(authHeaders(loginDetails)),
                    String.class);
        } catch (LoggedOutException e) {
            return "login";
        }
        return "redirect:scoring?courtId=" + courtId;
    }


    private HttpHeaders authHeaders(final LoginDetails loginDetails) {
        return new HttpHeaders() {{
            set("userName", loginDetails.getLoginName());
            set("token", loginDetails.getToken());
        }};
    }

    private List<Schedule> getSchedules(final LoginDetails loginDetails) {
        final String url = ADMIN_API_BASE_URL + "/schedules?_s=scheduleGroup.status==A";
        ResponseEntity<List<Schedule>> responseEntity = restTemplate.exchange(url,
                HttpMethod.GET,
                null,
                new ParameterizedTypeReference<List<Schedule>>() {
                });
        return responseEntity.getBody();
    }

    private LoginDetails getLoginDetails(final HttpSession session) {
        final LoginDetails loginDetails = (LoginDetails) session.getAttribute("loginDetails");
        if (loginDetails == null) {
            throw new LoggedOutException();
        }
        return loginDetails;
    }


}
