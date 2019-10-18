class QrcodeController < ApplicationController
  before_action :set_photo, only: [:download]
    def download
      qr = RQRCode::QRCode.new(url_for(@photo))
      png = qr.as_png(
          bit_depth: 1,
          border_modules: 4,
          color_mode: ChunkyPNG::COLOR_GRAYSCALE,
          color: 'black',
          file: nil,
          fill: 'white',
          module_px_size: 6,
          resize_exactly_to: false,
          resize_gte_to: false,
          size: 480
        )
        send_data png, type: Mime::Type.lookup("image/png"), disposition: 'inline'
    end
    
    def set_photo
      @photo = Photo.find(params[:id])
    end
end
