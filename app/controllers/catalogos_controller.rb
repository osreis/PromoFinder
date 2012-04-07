class CatalogosController < ApplicationController
  # GET /catalogos
  # GET /catalogos.json
  def index
    @catalogos = Catalogo.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @catalogos }
    end
  end

  # GET /catalogos/1
  # GET /catalogos/1.json
  def show
    @catalogo = Catalogo.find(params[:id])
	@produtos = @catalogo.produtos
    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @catalogo }
    end
  end

  # GET /catalogos/new
  # GET /catalogos/new.json
  def new
    @catalogo = Catalogo.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @catalogo }
    end
  end

  # GET /catalogos/1/edit
  def edit
    @catalogo = Catalogo.find(params[:id])
	@catalogo.data_inicio =  @catalogo.data_inicio.strftime("%d/%m/%Y")
	@catalogo.data_fim =  @catalogo.data_fim.strftime("%d/%m/%Y")
  end

  # POST /catalogos
  # POST /catalogos.json
  def create
    @catalogo = Catalogo.new(params[:catalogo])

    respond_to do |format|
      if @catalogo.save
        format.html { redirect_to catalogos_url, :notice => 'Catálogo adicionado com sucesso.' }
        format.json { render :json => @catalogo, :status => :created, :location => @catalogo }
      else
        format.html { render :action => "new" }
        format.json { render :json => @catalogo.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /catalogos/1
  # PUT /catalogos/1.json
  def update
    @catalogo = Catalogo.find(params[:id])

    respond_to do |format|
      if @catalogo.update_attributes(params[:catalogo])
        format.html { redirect_to catalogos_url, :notice => 'Catálogo alterado com sucesso' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @catalogo.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /catalogos/1
  # DELETE /catalogos/1.json
  def destroy
    @catalogo = Catalogo.find(params[:id])
    @catalogo.destroy

    respond_to do |format|
      format.html { redirect_to catalogos_url }
      format.json { head :no_content }
    end
  end
  
  def destroy_catalogo
    @catalogo = Catalogo.find(params[:id])
    
	@catalogo.produtos.each do |produto| 
		produto.destroy
	end
	
	@catalogo.destroy

    respond_to do |format|

		format.html { redirect_to catalogos_url, :notice => 'Catálogo removido com sucesso' }
		format.json { head :no_content }

    end
  end
  
end
