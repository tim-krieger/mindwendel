defmodule MindwendelWeb.ModalComponent do
  use MindwendelWeb, :live_component

  @impl true
  def render(assigns) do
    ~L"""
    <div id="<%= @id %>" class="modal fade show" tabindex="-1" phx-hook="Modal"
      phx-target="#<%= @myself %>"
      phx-page-loading
    >
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title"><%= assigns.opts[:title] %></h5>
            <%= live_patch raw("&times;"), to: @return_to, class: "phx-modal-close" %>
          </div>
          <div class="modal-body">
            <%= live_component @socket, @component, @opts %>
          </div>
        </div>
      </div>
    </div>
    """
  end

  @impl true
  def handle_event("close", _, socket) do
    {:noreply, push_patch(socket, to: socket.assigns.return_to)}
  end
end
