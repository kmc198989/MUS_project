package com.mus.service.Exception;

import lombok.Getter;

public enum ExceptionCode {
	
	PAY_CANCEL(404, "PAY CANCLE");

    @Getter
    private int status;

    @Getter
    private String message;

    ExceptionCode(int status, String message) {
        this.status = status;
        this.message = message;
    }
}
