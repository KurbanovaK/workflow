package com.kindergarten.workflow.web.controllers;

import com.kindergarten.workflow.data.UserRepository;
import com.kindergarten.workflow.domain.Roles;
import com.kindergarten.workflow.domain.User;
import com.kindergarten.workflow.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Collections;
import java.util.Map;

@Controller
public class UserController {
    @Autowired
    private UserRepository userRepository;

    @Autowired
    private UserService userService;

    @PreAuthorize("hasAuthority('ADMIN')")
    @GetMapping("/user/edit/{user}")
    public String userEditForm(  @AuthenticationPrincipal User principal, @PathVariable User user, Model model) {
        if (principal != null){
            if (!principal.getRoles().contains(Roles.Admin)){
                return "redirect:/main";
            }
        }
        if (user != null) {

            model.addAttribute("user", user);
            model.addAttribute("roles", Roles.values());

            return "userEdit";
        }else{
            return "redirect:/users/list";
        }
    }

    @PreAuthorize("hasAuthority('Admin')")
    @PostMapping("/user")
    public String userSave(
            @AuthenticationPrincipal User principal,
            @RequestParam String username,
            @RequestParam Map<String, String> form,
            @RequestParam("userId") User user
    ) {
        if (principal != null){
            if (!principal.getRoles().contains(Roles.Admin)){
                return "redirect:/main";
            }
        }
        userService.saveUser(user, username, form);

        return "redirect:/users/list";
    }
    @PreAuthorize("hasAuthority('Admin')")
    @GetMapping("/users/list")
    public String userList(@AuthenticationPrincipal User user, Model model) {
        if (user != null){
            if (!user.getRoles().contains(Roles.Admin)){
                return "redirect:/main";
            }
        }
        model.addAttribute("users", userRepository.findAll());
        return "userList";
    }
    @GetMapping("/registration")
    public String registration(){
        return "registration";
    }

    @PostMapping("/registration")
    public String addUser(User user, Map<String, Object> model){
        User dbUser =  userRepository.findByUsername(user.getUsername());
        if (dbUser != null){
            model.put("message", "Пользователь с таким именем уже зарегистрирован!");
            return "registration";
        }
        user.setActive(true);
        user.setRoles(Collections.singleton(Roles.User));
        userRepository.save(user);
        return "redirect:/login";
    }

        @RequestMapping(value="/logout",method = RequestMethod.GET)
        public String logout(HttpServletRequest request){
            HttpSession httpSession = request.getSession();
            httpSession.invalidate();
            return "redirect:/main";
    }

    @RequestMapping(value="/login/error",method = RequestMethod.GET)
    public String loginError(HttpServletRequest request, Model model){
        model.addAttribute("message", "Логин или пароль введены неверно");
        return "login";
}}
