package com.ltt.service.impl;

import com.ltt.dto.TransferDto;
import com.ltt.mapper.AccountMapper;
import com.ltt.model.Account;
import com.ltt.model.TransactionRecord;
import com.ltt.service.AccountService;
import com.ltt.service.TransactionRecordService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;

@Service("AccountService")
public class AccountServiceImpl implements AccountService {

    @Autowired
    private AccountMapper accountMapper;

    @Autowired
    private TransactionRecordService transactionRecordService;

    @Override
    public Account login(Account account) {

        Account account1 = accountMapper.login(account);

        return account1;
    }

    @Override
    public boolean isExists(String cardNo) {
        int row = accountMapper.isExists(cardNo);
        if (row == 1){
            return true;
        }
        return false;
    }

    @Override
    public boolean isDisable(String cardNo) {
        int row = accountMapper.isDisable(cardNo);
        if(row == 1){
            return true;
        }

        return false;
    }

    @Override
    public Account selBalance(String cardNo) {
        Account account = accountMapper.selBalance(cardNo);

        return account;
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public int updateBalance(TransferDto transferDto) {
        //转账金额减少
        Account acc =selBalance(transferDto.getRollOutCardNo());
        double balance = Double.parseDouble(String.valueOf(acc.getBalance()))-Double.parseDouble(String.valueOf(transferDto.getTransferMoney()));
        int row = accountMapper.updateBalanceRecord(transferDto.getRollOutCardNo(), balance);
        TransactionRecord transactionRecord = new TransactionRecord();
        transactionRecord.setCardNo(transferDto.getRollOutCardNo());
        java.sql.Date time= new java.sql.Date(new Date().getTime());
        transactionRecord.setTransactionDate(time);
        transactionRecord.setTransactionAmount(transferDto.getTransferMoney());
        transactionRecord.setBalance(balance);
        transactionRecord.setTransactionType("转账");
        transactionRecordService.outInsert(transactionRecord);
        if (row ==1){
            Account account =selBalance(transferDto.getIntoCardNo());
            if(account != null){
                System.out.println(account.getBalance());
                double intoBalance = Double.parseDouble(String.valueOf(account.getBalance()))+Double.parseDouble(String.valueOf(transferDto.getTransferMoney()));
                accountMapper.updateBalanceRecord(transferDto.getIntoCardNo(),intoBalance);
                TransactionRecord tr = new TransactionRecord();
                tr.setCardNo(transferDto.getIntoCardNo());
                java.sql.Date date= new java.sql.Date(new Date().getTime());
                tr.setTransactionDate(date);
                tr.setTransactionAmount(transferDto.getTransferMoney());
                tr.setBalance(intoBalance);
                tr.setTransactionType("转账");
                transactionRecordService.outInsert(tr);
            }
        }
        return row;
    }

    @Override
    public boolean selPassword(String cardNo, String oldPassword) {
        Account account = accountMapper.selPassword(cardNo);
            if (account != null){
                if (!(account.getPassword().equals(oldPassword))){
                    return false;
                }
            }
        return true;
    }

    @Override
    public int updatePassword(String cardNo, String newPassword) {
        int row = accountMapper.updatePassword(cardNo,newPassword);
        if (row ==1){
            return row;
        }
        return 0;
    }
}
