*** Variables ***

${cancel_locator}  id=cancel
${continue_locator}  id=continue
${finish_locator}    id=finish
${checkout_locator}    id=checkout
${back_to_product_locator}  id=back-to-products


${firstname_locator}  id=first-name
${lastname_locator}  id=last-name
${pin_locator}  id=postal-code


${errorLocator}  //*[@id="checkout_info_container"]/div/form/div[1]/div[4]/h3

#${checkout_product_item_name}  xpath://div[contains(@class,'inventory_item_name')]  
${check_out_product_element}  xpath=//div[text()='TEMPLATE']
${order_completion_locator}   xpath://*[@id="checkout_complete_container"]/h2