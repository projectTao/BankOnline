package com.ltt.dto;

import java.io.Serializable;

public class TransferDto implements Serializable{

    private static final long serialVersionUID = -4340961423584865333L;

    private String rollOutCardNo;

    private String intoCardNo;

    private Double transferMoney;

    public String getRollOutCardNo() {
        return rollOutCardNo;
    }

    public void setRollOutCardNo(String rollOutCardNo) {
        this.rollOutCardNo = rollOutCardNo;
    }

    public String getIntoCardNo() {
        return intoCardNo;
    }

    public void setIntoCardNo(String intoCardNo) {
        this.intoCardNo = intoCardNo;
    }

    public Double getTransferMoney() {
        return transferMoney;
    }

    public void setTransferMoney(Double transferMoney) {
        this.transferMoney = transferMoney;
    }
}
