require 'rails_helper'

RSpec.feature "Task creation", type: :feature do
  scenario "User creates a task successfully" do
    visit new_task_path

    fill_in "Title", with: "Nueva tarea"
    check "Completado"
    click_button "Crear tarea"

    expect(page).to have_content("Tarea creada exitosamente.")
    expect(page).to have_content("Nueva tarea")
    expect(page).to have_content("Sí")
  end

  scenario "User fails to create a task without a title" do
    visit new_task_path

    click_button "Crear tarea"

    expect(page).to have_content("No puede estar en blanco")
  end
end
