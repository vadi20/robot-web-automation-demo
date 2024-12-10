*** Variables ***
#${drpSort}  xpath=//*[@id="header_container"]/div[2]/div/span/select
${drpSort}  xpath=//select[@data-test='product-sort-container']
#${lstProduct}  xpath=//div[@id='inventory_container']//div[@class='inventory_list']//div
#${lstProduct_title}  xpath=".//a[contains(@id,'title_link')]"
#${lstProduct_add}  xpath=.//button[contains(@class='btn_inventory')][contains(@id,'add-to-cart')]
#${lstProduct_remove}  xpath=.//button[contains(@class='btn_inventory')][contains(@id,'remove')]

${lstProduct_name}  xpath://div[@id='inventory_container']//div[@class='inventory_list']//div[@class='inventory_item']//div[@class='inventory_item_description']//div[@class='inventory_item_label']//a
${lstProduct_sort_locator}  xpath=//option[contains(text(),'TEMPLATE')]
${lstProduct_button_locator}  xpath=//div[text()='TEMPLATE']/ancestor::div[@class='inventory_item']//button



${product_element}  xpath=//div[text()='TEMPLATE']