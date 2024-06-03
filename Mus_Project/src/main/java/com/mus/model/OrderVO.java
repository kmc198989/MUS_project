package com.mus.model;

import lombok.Data;

@Data
public class OrderVO {

	private String cid;
	private String partner_order_id;
	private String partner_user_id;
	private String item_name;
	private Integer quantity;
	private Integer total_amount;
	private Integer tax_free_amount;
}
