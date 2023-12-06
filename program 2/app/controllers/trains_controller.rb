class TrainsController < ApplicationController
  before_action :set_train, only: %i[ show edit update destroy ]

  # GET /trains or /trains.json
  def index
    @trains = Train.all
    @high_rated_trains = Train.joins('INNER JOIN reviews ON trains.id = reviews.trainid')
                            .where('reviews.rating > ?', 3)
                            .group('trains.id')

  
  end



  # GET /trains/1 or /trains/1.json
  def show
  end

  # GET /trains/new
  def new
    @train = Train.new
  end

  # GET /trains/1/edit
  def edit
  end

  # POST /trains or /trains.json
  def create
    @train = Train.new(train_params)

    respond_to do |format|
      if @train.save
        format.html { redirect_to train_url(@train), notice: "Train was successfully created." }
        format.json { render :show, status: :created, location: @train }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @train.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /trains/1 or /trains/1.json
  def update
    respond_to do |format|
      if @train.update(train_params)
        format.html { redirect_to train_url(@train), notice: "Train was successfully updated." }
        format.json { render :show, status: :ok, location: @train }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @train.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /trains/1 or /trains/1.json
  def destroy
    @train.destroy

    respond_to do |format|
      format.html { redirect_to trains_url, notice: "Train was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def list_by_station
    @station_name = params[:station_name]
    @trains_departing = Train.where(departurestation: @station_name)
    @trains_terminating = Train.where(terminationstation: @station_name)
  end

  def get_upcoming_available_trains
    Rails.logger.debug("Current Time: #{Time.now.utc}")
    @trains_upcoming = Train.where("departuretime > ? AND seatsleft > 0", Time.now.utc)
  end

  def get_previous_available_trains
    Rails.logger.debug("Current Time: #{Time.now.utc}")
    @trains_previous = Train.where("departuretime < ? AND seatsleft > 0", Time.now.utc)
  end

  
  def search
    train_number = params[:train_number]
    
    @train = Train.find_by(id: train_number)
    if @train
      @tickets = Ticket.where(trainid: @train.id)
      passenger_ids = @tickets.pluck(:passengerid)

      passenger_ids_int = passenger_ids.uniq.map(&:to_i)

      if passenger_ids.any?
        @passengers = Passenger.where(id: passenger_ids_int)
        #puts "#{passenger_ids_int}"
      else
        @passengers = []
      end

      @passengers.each do |pass|
        puts "#{pass}"
      end

    else
      @tickets = []
      @passengers = []
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_train
      @train = Train.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def train_params
      params.require(:train).permit(:trainnumber, :departurestation, :terminationstation, :departuredate, :departuretime, :arrivaldate, :arrivaltime, :ticketprice, :traincapacity, :seatsleft)
    end
end
