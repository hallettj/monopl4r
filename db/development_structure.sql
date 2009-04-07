CREATE TABLE "accounts" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "user_id" integer, "name" varchar(255), "created_at" datetime, "updated_at" datetime);
CREATE TABLE "asset_types" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "identifier" varchar(255), "created_at" datetime, "updated_at" datetime);
CREATE TABLE "journals" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "batch_id" integer DEFAULT 0 NOT NULL, "type" varchar(255), "created_at" datetime, "updated_at" datetime);
CREATE TABLE "postings" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "account_id" integer, "journal_id" integer, "asset_type_id" integer, "amount" decimal DEFAULT 0.0 NOT NULL, "created_at" datetime, "updated_at" datetime);
CREATE TABLE "schema_migrations" ("version" varchar(255) NOT NULL);
CREATE TABLE "users" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "login" varchar(40), "name" varchar(100) DEFAULT '', "email" varchar(100), "crypted_password" varchar(40), "salt" varchar(40), "created_at" datetime, "updated_at" datetime, "remember_token" varchar(40), "remember_token_expires_at" datetime);
CREATE UNIQUE INDEX "index_accounts_on_user_id" ON "accounts" ("user_id");
CREATE UNIQUE INDEX "index_users_on_login" ON "users" ("login");
CREATE UNIQUE INDEX "unique_schema_migrations" ON "schema_migrations" ("version");
INSERT INTO schema_migrations (version) VALUES ('20090407064615');

INSERT INTO schema_migrations (version) VALUES ('20090407085231');

INSERT INTO schema_migrations (version) VALUES ('20090407085250');

INSERT INTO schema_migrations (version) VALUES ('20090407085315');

INSERT INTO schema_migrations (version) VALUES ('20090407085325');