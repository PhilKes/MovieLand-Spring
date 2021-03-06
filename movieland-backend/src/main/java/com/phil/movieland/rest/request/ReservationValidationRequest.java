package com.phil.movieland.rest.request;

public class ReservationValidationRequest {
    public enum PaymentMethod {
        CASH,
        DEBITCARD,
        PAYPAL
    }

    private long resId;
    private boolean validate;
    private PaymentMethod method;
    private Long cashierId;

    public long getResId() {
        return resId;
    }

    public void setResId(long resId) {
        this.resId=resId;
    }

    public boolean isValidate() {
        return validate;
    }

    public void setValidate(boolean validate) {
        this.validate=validate;
    }

    public PaymentMethod getMethod() {
        return method;
    }

    public void setMethod(PaymentMethod method) {
        this.method=method;
    }

    public Long getCashierId() {
        return cashierId;
    }

    public void setCashierId(Long cashierId) {
        this.cashierId=cashierId;
    }
}
