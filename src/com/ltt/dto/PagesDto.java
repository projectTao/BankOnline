package com.ltt.dto;

public class PagesDto {

    private Integer pageNum;

    private Integer pageSize;

    private String startDateForm;

    private String endDateForm;

    public Integer getPageNum() {
        return pageNum;
    }

    public void setPageNum(Integer pageNum) {
        this.pageNum = pageNum;
    }

    public Integer getPageSize() {
        return pageSize;
    }

    public void setPageSize(Integer pageSize) {
        this.pageSize = pageSize;
    }

    public String getStartDateForm() {
        return startDateForm;
    }

    public void setStartDateForm(String startDateForm) {
        this.startDateForm = startDateForm;
    }

    public String getEndDateForm() {
        return endDateForm;
    }

    public void setEndDateForm(String endDateForm) {
        this.endDateForm = endDateForm;
    }
}
