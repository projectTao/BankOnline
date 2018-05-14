package com.ltt.controller;
import com.github.pagehelper.PageInfo;
import com.ltt.dto.PagesDto;
import com.ltt.dto.TransferDto;
import com.ltt.model.TransactionRecord;
import com.ltt.pojo.Message;
import com.ltt.service.AccountService;
import com.ltt.service.TransactionRecordService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/transaction")
public class TransactionRecordController {

    @Autowired
    private TransactionRecordService transactionRecordService;

    @Autowired
    private AccountService accountService;

    @RequestMapping("/transfer")
    @ResponseBody
    public Message transfer(@RequestBody TransferDto transferDto){
        int row = accountService.updateBalance(transferDto);
        Message msg = new Message();
        if (row == 1){
                msg.setCode(200);
                msg.setMessage("操作成功！请继续选择其它服务");
            }
        return msg;
    }
    @RequestMapping("/page")
    public String page(PagesDto dto, Model model){
        PageInfo<TransactionRecord> pageInfo = transactionRecordService.listPage(dto);
        model.addAttribute("startDate",dto.getStartDateForm());
        model.addAttribute("endDate",dto.getEndDateForm());
        if (pageInfo.getList().size() !=0){
            model.addAttribute("page",pageInfo);
            return "page/queryAllRecord";
        }
        model.addAttribute("errorMsg","此时间范围内没有交易记录");
        return "page/queryAllRecord";
    }




}
