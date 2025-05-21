# Trip Mala - Gerenciador de Checklist de Viagens

## 📌 Descrição
Trip Mala é uma API Ruby on Rails que permite usuários criarem checklists personalizados para organizar itens de viagem. É possível categorizar itens, marcar como prontos e manter uma organização prática.

---

## ✅ Funcionalidades

- Cadastro e login de usuários (autenticação JWT)
- Criação de checklists de viagem
- Adição de itens ao checklist (com status marcado ou desmarcado)
- Filtragem de itens por categoria
- Operações CRUD para checklists e itens
- Operações CRUD para categorias restritas ao administrador

---

## 🔐 Acesso Administrativo às Categorias

A criação, edição e exclusão de categorias está restrita a usuários administradores, sendo exposta via namespace `admin`. Usuários comuns conseguem apenas visualizar a lista de categorias.

### Rotas públicas:

```http
GET /api/categories
```

### Rotas restritas a administradores:

```http
POST /api/admin/categories
PATCH /api/admin/categories/:id
DELETE /api/admin/categories/:id
```

**Atenção:** é necessário incluir o token JWT de um usuário administrador no header da requisição.

```http
Authorization: Bearer <token>
```

---

## 🔧 Tecnologias Utilizadas

- Ruby on Rails 7.1
- PostgreSQL
- JWT para autenticação
- RSpec para testes
- Rswag para documentação (em breve)

---

## 🚀 Instalação e Execução

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

Em caso de dúvidas ou sugestões, envie um e-mail para [rafael@devbatista.com](mailto:rafael@devbatista.com).

---

## 📝 Licença
Este projeto está licenciado sob os termos da licença MIT.
