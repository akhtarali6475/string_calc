class StringCalculatorsController < ApplicationController
  def index; end

  def add
    begin
      @result = StringCalculator.add(sanitize_newline_params)
    rescue StandardError => e
      @error = e.message
    end
    render :index
  end

  private

  def sanitize_newline_params
    params[:numbers].gsub('\\n', "\n")
  end
end
