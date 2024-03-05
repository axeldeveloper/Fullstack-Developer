# frozen_string_literal: true
ActiveAdmin.register_page "Dashboard" do
  menu priority: 1, label: proc { I18n.t("active_admin.dashboard") }

  content do
    # Cia um link para a página de usuários
    link_to "Usuários", admin_users_path
    # Exibe o número de usuários cadastrados
    panel "Dashboard" do
      div class: "card p-1" do
        h2 "Admins: #{User.where(role: true).count}"
      end

      div class: "card p-1" do
        h2 "Users: #{User.where(role: false).count}"
      end

      div class: "card p-1" do
        h1 "Total: #{User.count}"
      end
    end

  end
end