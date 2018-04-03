package com.qf.shop.pojo.dto;

public class BookDTO {

    private Integer bid;
    private String bname;
    private String image_fm;
    private Double price;
    private Integer stock;
    private String author;
    private String cname;

    public Integer getBid() {
        return bid;
    }

    public void setBid(Integer bid) {
        this.bid = bid;
    }

    public String getBname() {
        return bname;
    }

    public void setBname(String bname) {
        this.bname = bname;
    }

    public String getImage_fm() {
        return image_fm;
    }

    public void setImage_fm(String image_fm) {
        this.image_fm = image_fm;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public Integer getStock() {
        return stock;
    }

    public void setStock(Integer stock) {
        this.stock = stock;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getCname() {
        return cname;
    }

    public void setCname(String cname) {
        this.cname = cname;
    }
}
