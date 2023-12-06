class TicketsController < ApplicationController
  before_action :set_ticket, only: %i[ show edit update destroy ]

  # GET /tickets or /tickets.json
  def index
    @tickets = Ticket.all
  end

  def new
    @train = Train.find(params[:train_id])
    @train_id = params[:train_id]
    @ticket = Ticket.new(train_id: @train_id)
    # Other code for your 'new' action
  end

  # GET /tickets/1 or /tickets/1.json
  def show
  end

  # GET /tickets/new
  def new
    @ticket = Ticket.new
  end

  # GET /tickets/1/edit
  def edit
  end

  # POST /tickets or /tickets.json
  def create
    @ticket = Ticket.new(ticket_params)

    train_id = @ticket.trainid

train = Train.find_by(id: train_id)

if train
  train.update(traincapacity: train.traincapacity - 1)
end


    respond_to do |format|
      if @ticket.save
        format.html { redirect_to ticket_url(@ticket), notice: "Ticket was successfully created.\n Total price for your ticket is : $#{train.ticketprice}" }
        format.json { render :show, status: :created, location: @ticket }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @ticket.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tickets/1 or /tickets/1.json
  def update
    respond_to do |format|
      if @ticket.update(ticket_params)
        format.html { redirect_to ticket_url(@ticket), notice: "Ticket was successfully updated." }
        format.json { render :show, status: :ok, location: @ticket }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @ticket.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tickets/1 or /tickets/1.json
  def destroy
  # Retrieve the trainnumber from the @ticket
    train_id = @ticket.trainid


  @ticket.destroy

    train = Train.find_by(id: train_id)

if train
  train.update(traincapacity: train.traincapacity + 1)
end



  respond_to do |format|
    format.html do
      # You can use 'trainnumber' here for any further processing or displaying
      redirect_to tickets_url, notice: "Ticket with Train ID #{train_id} was successfully destroyed."
    end
    format.json { head :no_content }
  end
end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ticket
      @ticket = Ticket.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def ticket_params
      params.require(:ticket).permit(:passengerid, :trainid, :confirmationnumber)
    end
end
