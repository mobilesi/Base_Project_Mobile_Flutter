class ApiConstant {
  static final apiHost = "http://123.31.10.61:8080/pharmacy_service/";
//  static final apiHost = "https://api.pharmacy.vnpt.vn/pharmacy_service/";

  static final urlDefaultImage = "https://pharmacy.vnpt.vn/vnpt/myimage/no_image.png";
  static final urlRootImage = "https://pharmacy.vnpt.vn/vnpt/";

  static final LOGIN = "user/login";
  static final FORGOT_PASSWORD = "user/forgotPassword";
  static final LIST_SHOP = "menu/listShop";
  static final LIST_COUNTER = "selling/listCounter";
  static final INFO_CURRENT_SHOP = "selling/laytt_nguoibanhang";
  static final PAYMENT_FOR_SELL_IN_STORE = "selling/payment";
  static final PAYMENT_FOR_SELL_BY_CREATE_PRESCRIPTION= "selling/paymentKDBT";
  static final UPDATE_CUREENT_SHOP= "selling/capnhat_quaythu_lamviec";

  static final lookupPrescription = "selling/lookupPrescription";
  static final paymentBTTD = "selling/paymentBTTD";
  static final LIST_DRUG = "selling/listImported";
  static final listSellingTransaction = "selling/listSellingTransaction";

  //selling
  static final SELL_LIST_CUSTOMER = "selling/listCustomer";
  static final CAPNHAT_CONGNO_BANHANG = "balance/capnhat_congno_banhang";

  //category
  static final LIST_CATEGORY_DRUG = "selling/getList";
  static final LIST_CATEGORY_DOCTOR = "doctor/listDoctor";
  static final LIST_CATEGORY_PROVIDER = "crmOrg/listNCC";
  static final LIST_CATEGORY_CUSTOMER = "crmOrg/listCustomer";
  static final LIST_CATEGORY_NATIONAL_PHARMACY = "duocQuocGia/danhMuc";

  static final LIST_CATEGORY_SAMPLE_PRESCRIPTION = "samplePrescription/listSample";
  static final DETAIL_SAMPLE_PRESCRIPTION = "samplePrescription/detailSample";
  static final UPDATE_INFORMATION_CUSTOMER = "crmOrg/updateCustomer";

  static final GET_LIST_RECEIPT = "warehouse/listWarehouseInput";
  static final GET_LIST_PROVIDER = "warehouse/layds_ncc";
  static final GET_DETAIL_RECEIPT = "warehouse/getWarehouseInputDetail";
  static final CREATE_NEW_RECEIPT = "warehouse/lap_phieunhapkho";
  static final UPDATE_RECEIPT = "warehouse/update_phieunhap";
  static final GET_LIST_DRUG_INVENTORY = "warehouse/layds_sp_chonhapkho";
  static final PAYMENT_DRUG_INVENTORY = "warehouse/nhapkho";
  static final updateDebtReturn = "balance/capnhat_congno_phieunhaptra";
  static final GET_LIST_TRANSFER = "warehouse/listWarehouseOutput";
  static final UPDATE_DEBT_IMPORT_INVENTORY = "balance/capnhat_congno_phieunhap";
  static final CREATE_NEW_TRANSFER = "warehouse/themPhieuXuat";
  static final UPDATE_TRANSFER = "warehouse/update_phieuxuat";
  static final GET_LIST_DRUG_TRANSFER = "warehouse/layds_sp_choxuatkho";
  static final GET_LIST_INVENTORY = "warehouse/listWarehouse";
  static final HANDLE_EXPORT_INVENTORY = "warehouse/xuatkho";
  static final GET_DETAIL_TRANSFER = "warehouse/layds_thuoc_da_xuatkho";

  // report
  static final GET_DASHBOARD_REPORT = "dashboard/report";

  //price
  static final getListPriceLevel = "priceLevel/listPriceLevel";
  static final getListPriceLevelProduct = "priceLevel/listPriceLevelProduct";
  static final editProductPrice = "priceLevel/editProductPrice";

  //management returned
  static final listWarehouseInput = "warehouse/listWarehouseInput";
  static final layDsPhieubanTrahang = "warehouse/layds_phieuban_trahang";

  // management Cancel Export
  static final listWarehouseOutput = "warehouse/listWarehouseOutput";
  static final themPhieuXuatHuy = "warehouse/themPhieuXuatHuy";
  static final updatePhieuXuatHuy = "warehouse/update_phieuxuathuy";
  static final GET_LIST_DRUG_CANCEL_EXPORT = "warehouse/timThuocXuatHuy";
  static final addCancelExportDrug = "warehouse/themThuocXuatHuy";

}
