
# TripMala 🧳

API para organização de listas de viagem, com autenticação segura via JWT.

## ✅ Funcionalidades já implementadas

### 1. Autenticação com Devise + JWT
- Registro (`POST /signup`)
- Login (`POST /login`) — token JWT retornado no header `Authorization: Bearer <token>`
- Logout (`DELETE /logout`) — revogação do token usando `JwtDenylist`
- Proteção de rotas com autenticação

### 2. Estrutura de dados principal
- `User` possui muitas `TripChecklists`
- `TripChecklist` possui muitos `ChecklistItems`

### 3. Serialização com ActiveModel::Serializer
- Respostas JSON limpas (sem timestamps)
- Inclusão de dados relacionados (ex: itens dentro do checklist)

### 4. Categorias para os itens
- Model `Category` criada
- Relacionamento entre `ChecklistItem` e `Category`
- Filtro por categoria no endpoint:
  ```
  GET /api/trip_checklists/:trip_checklist_id/checklist_items?category_id=...
  ```

---

## 🔒 Exemplo de uso com token

```http
POST /login
Authorization: Bearer <token>
```

---

## 📌 Próximos passos

- Validações e mensagens de erro padronizadas em JSON
- Documentação com Swagger (`rswag`)
- Edição e exclusão de checklists e itens
- Upload de imagem (futuramente)
- Integração com frontend mobile/web

---
