report zur_create_sales_order_basic.

types: begin of ty_sales_order,
         sales_doc_type type auart,
         sales_org      type vkorg,
         dist_channel   type vtweg,
         division       type spart,
         customer       type kunnr,
         material       type matnr,
         order_quantity type kwmeng, "VBAK (Header) & VBAP (Item details)
         plant          type werks, "t001W
       end of ty_sales_order.

data: gt_sales_order type standard table of ty_sales_order,
      g_sales_order  type ty_sales_order,
      gv_kunnr       type kunnr,
      gv_matnr       type matnr.


data: gs_order_header_in     type bapisdhd1,
      gs_order_header_inx    type bapisdhd1x,
      gv_salesdocument       type  bapivbeln-vbeln,
      gt_salesdocument       like table of gv_salesdocument,
      gt_return              type table of bapiret2,
      gt_order_items_in      type table of bapisditm,
      gs_order_items_in      type bapisditm,
      gt_order_items_inx     type table of bapisditmx,
      gs_order_items_inx     type bapisditmx,
      gt_order_partners      type table of bapiparnr,
      gs_order_partners      type  bapiparnr,
      gt_order_schedules_in  type table of bapischdl,
      gs_order_schedules_in  type bapischdl,
      gt_order_schedules_inx type table of  bapischdlx,
      gs_order_schedules_inx type bapischdlx.
