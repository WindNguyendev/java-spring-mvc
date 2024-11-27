package vn.hoidanit.laptopshop.controller.admin;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import vn.hoidanit.laptopshop.domain.Role;
import vn.hoidanit.laptopshop.domain.User;
import vn.hoidanit.laptopshop.repository.UserRepository;
import vn.hoidanit.laptopshop.service.UploadSevice;
import vn.hoidanit.laptopshop.service.UserService;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import jakarta.servlet.ServletContext;

import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class UserController {
    private final UserService userService;
    private final UploadSevice uploadService;
    private final PasswordEncoder passwordEncoder;

    public UserController(UserService userService, UploadSevice uploadService, PasswordEncoder passwordEncoder) {
        this.userService = userService;
        this.uploadService = uploadService;
        this.passwordEncoder = passwordEncoder;
    }

    @RequestMapping("/")
    public String getHomePage(Model model) {
        List<User> arrUsers = this.userService.getAllUsers();

        arrUsers = this.userService.getAllUsersByEmail("ducphong2012001@gmail.com");

        model.addAttribute("wind", "hello");

        return "hello";
    }

    @GetMapping("/admin/user/create")
    public String getCreateUserAdmin(Model model) {
        model.addAttribute("newUser", new User());
        return "admin/user/create";
    }

    @PostMapping(value = "/admin/user/create")
    public String CreateUserPage(Model model,
            @ModelAttribute("newUser") User wind,
            @RequestParam("hoidanitFile") MultipartFile file) {
        String avatar = this.uploadService.handleSaveUploadFile(file, "avatar");
        String hashPassword = this.passwordEncoder.encode(wind.getPassword());
        // this.userService.handleSaveUser(wind);

        wind.setAvatar(avatar);
        wind.setPassword(hashPassword);
        wind.setRole(this.userService.getRoleByName(wind.getRole().getName()));
        this.userService.handleSaveUser(wind);
        return "redirect:/admin/user";
    }

    @RequestMapping("/admin/user")
    public String getListUsers(Model model) {
        List<User> users = this.userService.getAllUsers();
        model.addAttribute("users", users);
        return "admin/user/show";
    }

    @RequestMapping("/admin/user/{id}")
    public String getUserDetail(Model model, @PathVariable long id) {
        User userDetail = this.userService.getDetailUserbyId(id);
        model.addAttribute("user", userDetail);
        return "admin/user/detail";
    }

    @RequestMapping("/admin/user/update/{id}")
    public String updateUserPage(Model model, @PathVariable long id) {
        User user = this.userService.getDetailUserbyId(id);
        model.addAttribute("newUser", user);
        return "admin/user/update";
    }

    @PostMapping("/admin/user/update")
    public String UpdateUser(Model model, @ModelAttribute("newUser") User wind) {
        User user = this.userService.getDetailUserbyId(wind.getId());
        if (user != null) {
            user.setAddress(wind.getAddress());
            user.setFullname(wind.getFullname());
            user.setPhone(wind.getPhone());
            this.userService.handleSaveUser(user);
        }
        return "redirect:/admin/user";
    }

    @GetMapping("/admin/user/delete/{id}")
    public String getDeleteUserPage(Model model, @PathVariable long id) {
        model.addAttribute("id", id);
        model.addAttribute("deleteUser", new User());
        return "admin/user/delete";
    }

    @PostMapping("/admin/user/delete")
    public String postDeleteUser(Model model, @ModelAttribute("deleteUser") User wind) {
        this.userService.deleteUser(wind.getId());

        return "redirect:/admin/user";
    }

}
