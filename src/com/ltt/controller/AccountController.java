package com.ltt.controller;


import com.ltt.model.Account;
import com.ltt.pojo.Message;
import com.ltt.service.AccountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/users")
public class AccountController {

    @Autowired
    private AccountService accountService;

    @RequestMapping("/login")
    public String login(Account account, HttpServletRequest request){
        HttpSession session = request.getSession();
        Account account1 = accountService.login(account);
        if (account1 != null){
            session.setAttribute("account",account1);
            session.removeAttribute("msg");
            return "user/loginsuc";
        }else{
            boolean idExits = accountService.isExists(account.getCardNo());
                Message message = new Message();
                if (!idExits){
                    message.setCode(400);
                    message.setMessage("该卡号不正确，请确认是否填写正确");
                }else {
                    boolean isDisable = accountService.isDisable(account.getCardNo());
                    if (isDisable){
                        message.setCode(500);
                        message.setMessage("该卡号被冻结，如有疑问请联系客服");
                    }else{
                        message.setCode(600);
                        message.setMessage("登录失败，卡号或者密码错误");
                    }
            }
            session.setAttribute("msg",message);
            return "redirect:/pages/user/login.jsp";
        }
    }

    @RequestMapping("/logOut")
    public String logOut(HttpServletRequest request){
        request.getSession().invalidate();

        return "redirect:/pages/user/login.jsp";
    }


    @RequestMapping("/selBalance/{cardNo}")
    @ResponseBody
    public Account selBalance(@PathVariable("cardNo") String cardNo, Model model){
        Account account = accountService.selBalance(cardNo);
        return account;
    }
    @RequestMapping("/isExists/{intoCardNo}/{transferMoney:.+}")
    @ResponseBody
    public Message isExists(@PathVariable String intoCardNo,@PathVariable double transferMoney){
        boolean idExits = accountService.isExists(intoCardNo);
        Message message = new Message();
        if (!idExits){
            message.setCode(800);
            message.setMessage("转账失败！目标账户不存在");
        }else {
            boolean isDisable = accountService.isDisable(intoCardNo);
            if (isDisable){
                message.setCode(900);
                message.setMessage("该卡号被冻结，如有疑问请联系客服");
            }
            Account account = accountService.selBalance(intoCardNo);
            if (account != null){
                double balance = account.getBalance();
                if(Double.doubleToLongBits(balance) < Double.doubleToLongBits(transferMoney)){
                    message.setCode(1000);
                    message.setMessage("转账失败，转出账户余额不足");
                }
            }
        }
        return message;
    }

    @RequestMapping("/selPassword/{oldPassword}/{cardNo}")
    @ResponseBody
    public Message selPassword(@PathVariable("oldPassword") String oldPassword,@PathVariable("cardNo") String cardNo){
        boolean isPassword  = accountService.selPassword(cardNo,oldPassword);
        Message message = new Message();
        if (!isPassword){
           message.setCode(110);
           message.setMessage("旧密码输入错误");
           return message;
        }
        return message;
    }
    @RequestMapping("/updatePassword/{newPassword}/{cardNo}")
    @ResponseBody
    public Message updatePassword(@PathVariable("newPassword") String newPassword,@PathVariable("cardNo") String cardNo){
        int isPassword  = accountService.updatePassword(cardNo,newPassword);
        Message message = new Message();
        if (isPassword==1){
            message.setCode(120);
            message.setMessage("密码更改成功！！");
            return message;
        }
        return message;
    }

}
