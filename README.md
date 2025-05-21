# Trip Mala - Gerenciador de Checklist de Viagens

## 📌 Descrição

Trip Mala é uma API Ruby on Rails para organização de checklists de viagem. Usuários podem criar listas personalizadas, adicionar itens, marcar como prontos e categorizar cada item para facilitar o planejamento.

---

## ✅ Funcionalidades

- Cadastro e login de usuários (autenticação JWT)
- Criação e gerenciamento de checklists de viagem
- Adição, marcação e remoção de itens do checklist
- Filtragem de itens por categoria
- Operações CRUD para checklists e itens
- Operações CRUD para categorias (restritas a administradores)

---

## 🔐 Acesso Administrativo às Categorias

A criação, edição e exclusão de categorias é restrita a usuários administradores, via namespace `admin`. Usuários comuns podem apenas visualizar as categorias.

## 📚 Principais Rotas da API

### Autenticação

```http
POST   /login           # Login do usuário (JWT)
POST   /signup          # Cadastro de novo usuário
DELETE /logout          # Logout do usuário (revoga JWT)
```

### Perfil

```http
GET    /profile         # Exibe dados do usuário autenticado
```

### Checklists de Viagem

```http
GET    /api/trip_checklists
POST   /api/trip_checklists
GET    /api/trip_checklists/:trip_checklist_id
PATCH  /api/trip_checklists/:trip_checklist_id
DELETE /api/trip_checklists/:trip_checklist_id
```

### Itens do Checklist

```http
GET    /api/trip_checklists/:trip_checklist_id/checklist_items
POST   /api/trip_checklists/:trip_checklist_id/checklist_items
PATCH  /api/trip_checklists/:trip_checklist_id/checklist_items/:id
DELETE /api/trip_checklists/:trip_checklist_id/checklist_items/:id
PUT    /api/trip_checklists/:trip_checklist_id/checklist_items/:id/check  # Marca/desmarca item
```

### Categorias

```http
GET    /api/categories
```

#### Rotas restritas a administradores

```http
POST   /api/admin/categories
PATCH  /api/admin/categories/:id
DELETE /api/admin/categories/:id
```

---

**Atenção:** Inclua o token JWT de um usuário administrador no header da requisição:

```http
Authorization: Bearer <token>
```

---

## 🔧 Tecnologias Utilizadas

- Ruby on Rails 7.1
- PostgreSQL
- JWT para autenticação
- RSpec para testes automatizados
- Rswag para documentação de API (em breve)

---

## 🚀 Instalação e Execução

Clone o repositório e instale as dependências:

```bash
git clone https://github.com/seu-usuario/trip_mala.git
cd trip_mala
bundle install
yarn install --check-files
rails db:create db:migrate
dotenv rails s
```

---

## 📬 Contato

Dúvidas ou sugestões? Entre em contato pelo e-mail [rafael@devbatista.com](mailto:rafael@devbatista.com).

---

## 📝 Licença

Este projeto está licenciado sob os termos da licença MIT.