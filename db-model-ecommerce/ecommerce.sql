CREATE TYPE "clothing_sizes" AS ENUM ('XXS', 'XS', 'S', 'M', 'L', 'XL', 'XXL', '3XL', '4XL');
CREATE TYPE "transaction_status" AS ENUM ('created', 'canceled', 'processed', 'done');

CREATE TABLE "public.clients" (
	"id" serial NOT NULL,
	"name" serial(64) NOT NULL,
	"email" serial NOT NULL UNIQUE,
	"password" serial(255) NOT NULL,
	CONSTRAINT "clients_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.products" (
	"id" serial NOT NULL,
	"name" TEXT NOT NULL,
	"categoryId" integer NOT NULL,
	"sizeId" integer NOT NULL,
	"mainPicture" TEXT NOT NULL,
	"price" bigserial NOT NULL,
	CONSTRAINT "products_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.categories" (
	"id" serial NOT NULL,
	"categoryName" TEXT NOT NULL UNIQUE,
	CONSTRAINT "categories_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.sizes" (
	"id" serial NOT NULL,
	"size" "clothing_sizes" NOT NULL UNIQUE,
	CONSTRAINT "sizes_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.pictures" (
	"id" serial NOT NULL,
	"productId" integer NOT NULL,
	"pic" TEXT NOT NULL,
	CONSTRAINT "pictures_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.cartItem" (
	"id" serial NOT NULL,
	"productId" integer NOT NULL,
	"quantity" integer NOT NULL DEFAULT '1',
	CONSTRAINT "cartItem_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.reports" (
	"id" serial NOT NULL,
	"transactionId" integer NOT NULL,
	"status" "transaction_status" NOT NULL DEFAULT 'created',
	"date" TIMESTAMP NOT NULL DEFAULT NOW(),
	CONSTRAINT "reports_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.transactions" (
	"id" serial NOT NULL,
	"cartId" integer NOT NULL,
	"total" bigserial NOT NULL,
	CONSTRAINT "transactions_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.deliveries" (
	"id" serial NOT NULL,
	"address" TEXT NOT NULL,
	"transactionId" integer NOT NULL,
	CONSTRAINT "deliveries_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);




ALTER TABLE "products" ADD CONSTRAINT "products_fk0" FOREIGN KEY ("categoryId") REFERENCES "categories"("id");
ALTER TABLE "products" ADD CONSTRAINT "products_fk1" FOREIGN KEY ("sizeId") REFERENCES "sizes"("id");



ALTER TABLE "pictures" ADD CONSTRAINT "pictures_fk0" FOREIGN KEY ("productId") REFERENCES "products"("id");

ALTER TABLE "cartItem" ADD CONSTRAINT "cartItem_fk0" FOREIGN KEY ("productId") REFERENCES "products"("id");

ALTER TABLE "reports" ADD CONSTRAINT "reports_fk0" FOREIGN KEY ("transactionId") REFERENCES "transactions"("id");

ALTER TABLE "transactions" ADD CONSTRAINT "transactions_fk0" FOREIGN KEY ("cartId") REFERENCES "cartItem"("id");

ALTER TABLE "deliveries" ADD CONSTRAINT "deliveries_fk0" FOREIGN KEY ("transactionId") REFERENCES "transactions"("id");










