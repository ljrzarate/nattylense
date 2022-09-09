class PresetsController < ApplicationController

  def index
    @presets = Preset.all
  end

  def show
    @preset = Preset.find_by(id: params[:id])
    preference_data = {
      items: [
        {
          title: 'My Item',
          unit_price: 75,
          quantity: 1
        }
      ]
    }
    preference_response = $mercado_pago.preference.create(preference_data)
    preference = preference_response[:response]
    # This value replaces the String "<%= @preference_id %>" in your HTML
    @preference_id = preference['id']
  end
end
