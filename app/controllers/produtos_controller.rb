class ProdutosController < ApplicationController
  # GET /produtos
  # GET /produtos.json
  def index
    @produtos = Produto.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @produtos }
    end
  end

  
  def search
 
   respond_to do |format|
      format.html # show.html.erb
	end
  end
  
  
  def buscar
 
   @produto = Produto.where("codigo_barras = ?", params[:search])
	id = "notFound"
	data = Time.new.to_date
	@produto.each do |prod|
		if (prod.catalogo.data_inicio <= data and prod.catalogo.data_fim >= data)
			id = prod.id.to_s
		end
	end	
   respond_to do |format|
      format.html { redirect_to ("/produtos/" + id)}
      format.json { render :json => @produto }
	end
  end
  
  # GET /produtos/1
  # GET /produtos/1.json
  def show
  begin
		@produto = Produto.find(params[:id])
	rescue
		@produto = nil
	end
    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @produto }
    end
  end

  # GET /produtos/new
  # GET /produtos/new.json
  def new
    @produto = Produto.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @produto }
    end
  end

  # GET /produtos/1/edit
  def edit
    @produto = Produto.find(params[:id])
  end

  # POST /produtos
  # POST /produtos.json
  def create
    @produto = Produto.new(params[:produto])
	@catalogo = Catalogo.find(params[:catalogo][:id])
	@produto.catalogo = @catalogo
    respond_to do |format|
      if @produto.save
        format.html { redirect_to "/produtos/new", :notice => 'Produto adicionado com sucesso' }
        format.json { render :json => @produto, :status => :created, :location => @produto }
      else
        format.html { render :action => "new" }
        format.json { render :json => @produto.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /produtos/1
  # PUT /produtos/1.json
  def update
    @produto = Produto.find(params[:id])
	@catalogo = Catalogo.find(params[:catalogo][:id])
	@produto.catalogo = @catalogo
    respond_to do |format|
      if @produto.update_attributes(params[:produto])
        format.html { redirect_to produtos_url, :notice => 'Produto alterado com sucesso' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @produto.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /produtos/1
  # DELETE /produtos/1.json
  def destroy
    @produto = Produto.find(params[:id])
    @produto.destroy

    respond_to do |format|
      format.html { redirect_to produtos_url }
      format.json { head :no_content }
    end
  end
  

  def destroy_produto
    @produto = Produto.find(params[:id])
    @produto.destroy
	 respond_to do |format|
		format.html { redirect_to produtos_url, :notice => 'Produto removido com sucesso' }
      format.json { head :no_content }
    end
	
  end
  

end
