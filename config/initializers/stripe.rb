# Rails.configuration.stripe = {
#   :publishable_key => ENV['STRIPE_PUBLISHABLE_KEY'],
#   :secret_key => ENV['STRIPE_SECRET_KEY']
# }
# # Stripe.api_key = Rails.application.credentials.dig(:stripe, :secret_key)
# Stripe.api_version = "2023-10-16"
# Rails.configuration.stripe = {
#   publishable_key: ENV['STRIPE_PUBLISHABLE_KEY'],
#   secret_key: ENV['STRIPE_SECRET_KEY']
# }
# Stripe.api_key = Rails.configuration.stripe[:secret_key]

Rails.application.credentials.dig(:development, :stripe, :publishable_key)
Rails.application.credentials.dig(:development, :stripe, :secret_key)

Rails.application.credentials.dig(:production, :stripe, :publishable_key)
Rails.application.credentials.dig(:production, :stripe, :secret_key)

# Development environment
Stripe.api_key = Rails.application.credentials.dig(:development, :stripe, :secret_key)

# Production environment
Stripe.api_key = Rails.application.credentials.dig(:production, :stripe, :secret_key)
