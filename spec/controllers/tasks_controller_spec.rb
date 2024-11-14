require 'rails_helper'

RSpec.describe TasksController, type: :controller do
  let!(:task) { Task.create(title: "Sample Task", completed: false) }

  describe "GET #index" do
    it "assigns all tasks to @tasks" do
      get :index
      expect(assigns(:tasks)).to eq([task])
    end
  end

  describe "GET #show" do
    it "assigns the requested task to @task" do
      get :show, params: { id: task.id }
      expect(assigns(:task)).to eq(task)
    end
  end

  describe "POST #create" do
    it "creates a new task" do
      expect {
        post :create, params: { task: { title: "New Task", completed: false } }
      }.to change(Task, :count).by(1)
    end
  end

  describe "PATCH #update" do
    it "updates the requested task" do
      patch :update, params: { id: task.id, task: { title: "Updated Task" } }
      task.reload
      expect(task.title).to eq("Updated Task")
    end
  end

  describe "DELETE #destroy" do
    it "deletes the requested task" do
      expect {
        delete :destroy, params: { id: task.id }
      }.to change(Task, :count).by(-1)
    end
  end
end
