class PresetsController < ApplicationController

  def index
    @presets = Preset.all
  end

  def show
    @preset = Preset.find_by(id: params[:id])
  end
end
