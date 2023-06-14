*bapi_salesorder_getlist
* importing value(customer_number)  type kunnr
*  value(sales_organization)  type vkorg
*  value(material)  type matnr optional
*  value(document_date)  type audat optional
*  value(document_date_to)  type audat optional
*  value(purchase_order)  type bstnk optional
*  value(transaction_group)  type char1 default 0
*  value(purchase_order_number)  type bstkd optional
*  value(material_evg)  type bapimgvmatnr optional
* exporting value(return)  type bapireturn
* tables sales_orders  type standard table of bapiorders with header line
*  extensionin  type standard table of bapiparex with header line optional
*  extensionex  type standard table of bapiparex with header line optional
*
*
*Documentation
*
*Sales order: List of all Orders for Customer
*
*Longtext Documentation  Longtext Documentation
*
*Parameters
*
*
*importing  customer_number   Customer number
*importing  sales_organization   Sales organization
*importing  material   Material number
*importing  document_date   Entry date
*importing  document_date_to   Entry date up to and including
*importing  purchase_order   Customer purchase order number
*importing  transaction_group   Single-Character Indicator
*importing  purchase_order_number   Customer Purchase Order Number
*importing  material_evg   Long Material Number
*exporting  return   Error Text
*tables  sales_orders   Table of orders for the customer
*tables  extensionin   Reference Structure for BAPI Parameters ExtensionIn/Extensio
*tables  extensionex   Reference Structure for BAPI Parameters ExtensionIn/Extensio


data: lv_customer_number    type kunnr value '48',
      lv_material           type matnr value '216',
      lv_sales_organization type vkorg value 'ZM03'.

data: gt_sales_orders type standard table of bapiorders.
data: gt_return type bapireturn.

lv_customer_number  = |{ lv_customer_number width = 10 alpha = in }|.

all function 'BAPI_SALESORDER_GETLIST'
  exporting
    customer_number    = lv_customer_number   " Customer number
*    sales_organization =     " Sales organization
*    material           = lv_material   " Material number
*   document_date      =     " Entry date
*   document_date_to   =     " Entry date up to and including
*   purchase_order     =     " Customer purchase order number
*   transaction_group  = 0    " Single-Character Indicator
*   purchase_order_number =     " Customer Purchase Order Number
*   material_evg       =     " Long Material Number
  importing
    return             = gt_return    " Error Text
  tables
    sales_orders       = gt_sales_orders    " Table of orders for the customer
*   extensionin        =     " Reference Structure for BAPI Parameters ExtensionIn/Extensio
*   extensionex        =     " Reference Structure for BAPI Parameters ExtensionIn/Extensio
  .
