class CreateStatuses < ActiveRecord::Migration
  def self.up
      create_table :statuses do |t|
        t.string :label
        t.string :label_es
        t.text :description
        t.text :description_es
        t.integer :position

        t.timestamps
      end





    Status.create!(
    :label => "pending",
    :label_es => "libre",
    :description_es => "Textos que pueden ser elegidos por los escritores",
    :description => "Not taken by any user, open to take",
    :position => 1)

    Status.create!(
    :label => "taken",
    :label_es => "seleccionados",
    :description_es => "Textos que ya han sido elegidos por algun escritor y se encuntran en proceso de creación",
    
    :description => "taken by a user, in progress, not finished",
    :position => 2)

    Status.create!(
    :label => "review",
    
    :label_es => "pendiente de revisión",
    :description_es => "Textos que necesitan que un administrador les de el visto bueno o sugiera mejoras",

    :description => "finished, admin has to look at to approve",
    :position => 3)

    Status.create!(
    :label => "improve",
    :label_es => "necesita mejora",
    :description_es => "Textos que necesitan que el escritor rectifique",

    :description => "has to be changed by user",
    :position => 4)

    Status.create!(
    :label => "improved",
    :label_es => "mejorado",
    :description_es => "Textos que hay sido rectificados despues de una sugerencia por parte de un administrador y que de nuevo necesitan ser revisados",

    :description => "was changed by user",
    :position => 5)
    
    Status.create!(
    :label => "ready",
    :label_es => "terminado",
    :description_es => "Textos que han recibido el visto bueno por parte de un administrador",

    :description => "ready, not being changed, earnings can be calculated",
    :position => 6)

    Status.create!(
    :label => "payed",
    :label_es => "pagado",
    :description => "payed out",
    :position => 7)

    Status.create!(
    :label => "integrated",
    :label_es => "integrado",
    :description => "Integrated into webpage",
    :position => 8)





  end

  def self.down
      drop_table :statuses
  end
end