package com.kong.shop.action.product;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;

import com.kong.shop.model.product.ProductType;
import com.kong.shop.service.product.IProductTypeService;
import com.kong.shop.utils.SiteUrl;
import com.opensymphony.xwork2.ActionSupport;

@Controller
public class ProductTypeManageAction extends ActionSupport {
	private static final long serialVersionUID = -6956692923392743452L;

	private IProductTypeService productTypeService;
	private ProductType type;
	private String urladdress = SiteUrl.read("control.product.type.list");

	public String getUrladdress() {
		return urladdress;
	}

	public void setUrladdress(String urladdress) {
		this.urladdress = urladdress;
	}

	public ProductType getType() {
		return type;
	}

	public void setType(ProductType type) {
		this.type = type;
	}

	public IProductTypeService getProductTypeService() {
		return productTypeService;
	}

	@Resource
	public void setProductTypeService(IProductTypeService productTypeService) {
		this.productTypeService = productTypeService;
	}

	public String addUI() {
		return "addUI";
	}

	public String add() {
		// If name not define, go to global message page
		if (type.getName() == null || "".equals(type.getName())) {
			addActionError("Please give one name for product type which you defined.");
			return "message";
		}

		// If name exist, go to global message page
		if (productTypeService.checkNameExist(type.getName().trim())) {
			addActionError("Your given type name already exist, please change your type name.");
			return "message";
		}

		ProductType parent = null;
		if (type.getParent().getTypeid() != null
				&& type.getParent().getTypeid() > 0) {
			parent = productTypeService.find(ProductType.class, type
					.getParent().getTypeid());
		}

		// If no parent, then just save that type
		type.setParent(parent);
		productTypeService.save(type);
		addActionMessage("Add Product Type Passed!");

		return "message";
	}

	public String editUI() {
		Integer typeid = type.getTypeid();
		type = productTypeService.find(ProductType.class, typeid);
		return "editUI";
	}

	public String edit() {
		// If name not define, go to global message page
		if (type.getName() == null || "".equals(type.getName())) {
			addActionError("Please give one name for product type which you defined.");
			return "message";
		}

		// If name exist, go to global message page
		if (productTypeService.checkNameExist(type.getName().trim())) {
			addActionError("Your given type name already exist, please change your type name.");
			return "message";
		}

		productTypeService.update(type);
		addActionMessage("Update Product Type Passed!");
		return "message";
	}

	public String queryUI() {
		return "queryUI";
	}
}
