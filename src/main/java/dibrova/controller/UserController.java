package dibrova.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import dibrova.model.SearchUserName;
import dibrova.model.User;
import dibrova.service.UserService;

import javax.validation.Valid;
import java.util.ArrayList;
import java.util.List;

@Controller
public class UserController {
    private UserService userService;
    private List<List<User>> pagesUsers;

    @Autowired(required = true)
    @Qualifier(value = "userService")
    public void setUserService(UserService userService) {
        this.userService = userService;
    }

    @RequestMapping("showUsers")
    public String listUsers(Model model) {
        return listUsers(0, model);
    }

    @RequestMapping(value = "showUsers/{index}", method = RequestMethod.GET)
    public String listUsers(@PathVariable("index") int index, Model model) {
        if (pagesUsers == null) {
            pagesUsers = this.userService.listUsers();
        }

        if(pagesUsers.size() == 0) {
            model.addAttribute("pageCount", 0);
            return "showUsers";
        }

        if (index < 0) {
            index = 0;
        } else if (index > pagesUsers.size() - 1) {
            index = pagesUsers.size() - 1;
        }
        List<Integer> refs = new ArrayList<>();
        for (int i = 0; i < pagesUsers.size(); i++) {
            refs.add(i);
        }
        model.addAttribute("refs", refs);
        model.addAttribute("page", pagesUsers.get(index));
        model.addAttribute("pageCount", pagesUsers.size());

        return "showUsers";
    }

    @RequestMapping(value = "showUsers/add", method = RequestMethod.POST)
    public String addUser(@ModelAttribute("user") @Valid User user, BindingResult result) {
        if (result.hasErrors()) {
            return "/addUser";
        }
        this.userService.addUser(user);
        pagesUsers = this.userService.listUsers();
        return "redirect:/showUsers";
    }

    @RequestMapping(value = "showUsers/edit", method = RequestMethod.POST)
    public String editUser(@ModelAttribute("user") @Valid User user, BindingResult result) {
        if (result.hasErrors()) {
            return "/editUser";
        }
        this.userService.updateUser(user);
        pagesUsers = this.userService.listUsers();
        return "redirect:/showUsers";
    }

    @RequestMapping("remove/{id}")
    public String removeUser(@PathVariable("id") int id) {
        this.userService.removeUser(id);
        pagesUsers = this.userService.listUsers();
        return "redirect:/showUsers";
    }

    @RequestMapping("addUser")
    public String add(Model model) {
        model.addAttribute("user", new User());
        return "addUser";
    }

    @RequestMapping("editUser/{id}")
    public String edit(@PathVariable("id") int id, Model model) {
        model.addAttribute("user", this.userService.getUserById(id));
        return "editUser";
    }

    @RequestMapping("searchName")
    public String searchString(@ModelAttribute("searchUserName") SearchUserName name, Model model) {
        model.addAttribute("foundUsers", this.userService.getUserByName(name.getSearchName()));
        return "searchName";
    }

    @RequestMapping("searchAdmin")
    public String searchAdmin(Model model) {
        model.addAttribute("foundUsers", this.userService.getUserByAdmin());
        return "searchAdmin";
    }
}
