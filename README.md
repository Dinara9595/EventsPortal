# README
# EventsPortal

Здравствуй, username!

Это приложение выполнено в рамках тестового задания.
Оно представляет собой сайт по типу портала новостей.
Клиентская часть выполнена на React JS, серверная - на Ruby
on Rails.

Клиентская часть состоит из 3-х страниц: главная (http://localhost:3000), 
список новостей (http://localhost:3000/events), 
страница одной новости (http://localhost:3000/events/1 например, с id=1), 
404 Страница не найдена (http://localhost:3000/*, либо любой другой неверный путь).
Имеется возможность фильтрации по дате добавления. Новости отображаются с картинками как в списке 
новостей, так и на странице одной новости.

Панель администратора реализована на Ruby on Rails. Доступна по адресу http://localhost:10524.
Для реализации Login/Logout администратора
используется `gem devise`. Администраторы создаются через консоль. 
Все действия по просмотру/созданию/редактированию/удалению новостей
доступны только аутентифицированному администратору. Для возможности спрятать новость на клиентской части 
без физического удаления имеется поле `published` у модели `event` (новость), которое устанавливается в true/false при 
создании или редактировании новости. К каждой новости можно прикрепить изображение только с расширениями (jpg, png).

Клиентская часть показывает изменения в списке новостей без перезагрузки страницы.

* Ruby version in `.ruby-version`

* Node version in `.nvmrc`

* System dependencies

ruby, nodejs, postgresql 14+

* Configuration
Frontend-часть:

```shell
cd frontend
npm install
npm start
```
  
Backend-часть:
```shell
bundle install
bundle exec rails db:setup
rails s -p 10524
```

* Database creation

```shell
bundle exec rails db:create 
```

* Database initialization

```shell
bundle exec rails db:setup 
```

* How to run the test suite

```shell
RAILS_ENV=test bundle exec rails db:create
RAILS_ENV=test bundle exec rails db:schema:load
bundle exec rspec
```
