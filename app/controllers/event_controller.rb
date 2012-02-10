class EventController < ApplicationController

   def list
      @event = Event.find(:all)
   end
   
   def show
      @event = Event.find(params[:id])
   end

   def new
     @event = Event.new
     #@submission = Submission.find(:all)
     #@talk = Talk.find(:all)
   end

   def create
      @event = Event.new(params[:event])
      
      if @event.save
            redirect_to :action => 'list' #ovdje preusmjeravamo akciju
      else
            #@submission = Submission.find(:all)
            #@talk = Talk.find(:all)
            render :action => 'new'
      end
      
   end
   
      def edit
      @event = Event.find(params[:id])
      @submission = Submission.find(:all)
      @talk = Talk.find(:all)
   end
   
   def update
      @event = Event.find(params[:id])
      if @event.update_attributes(params[:event])
         redirect_to :action => 'show', :id => @event
      else
          @submission = Submission.find(:all)
          @talk = Talk.find(:all)
          render :action => 'edit'
      end
   end
   
   def delete
      Event.find(params[:id]).destroy
      redirect_to :action => 'list'
   end
   
   def show_subjects
     
   end   

end
