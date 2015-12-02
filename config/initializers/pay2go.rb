Pay2go.setup do |pay2go|
	if Rails.env.development?
		pay2go.merchant_id = "11123324"
		pay2go.hash_key = "VQoOwqkEPja2RwkAgkWpdrpeJXnmr5Zm"
		pay2go.hash_iv = "WoasOv7DOiFGO0h4"
		pay2go.service_url = "https://capi.pay2go.com/MPG/mpg_gateway"
	else
		pay2go.merchant_id = "11123324"
		pay2go.hash_key = "VQoOwqkEPja2RwkAgkWpdrpeJXnmr5Zm"
		pay2go.hash_iv = "WoasOv7DOiFGO0h4"
		pay2go.service_url = "https://api.pay2go.com/MPG/mpg_gateway"
	end
end