report zur_create_sales_order_basic.

types: begin of ty_sales_order,
         sales_doc_type       type auart,
         sales_org            type vkorg,
         dist_channel         type vtweg,
         division             type spart,
         purchase_or_n        type ebeln,
         customer             type kunnr,
         material             type matnr,
         order_quantity       type kwmeng, 
         plant                type werks, 
         item_number          type posnr, 
         requirement_quantity type plnmg,
       end of ty_sales_order.
       
       
data: gt_sales_order type standard table of ty_sales_order,
gs_sales_order type ty_sales_order,
gv_kunnr       type kunnr,
gv_matnr       type matnr.
