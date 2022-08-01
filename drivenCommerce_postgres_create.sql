CREATE TABLE "users" (
	"id" serial NOT NULL,
	"name" TEXT NOT NULL,
	"email" TEXT NOT NULL UNIQUE,
	"password" TEXT NOT NULL,
	CONSTRAINT "users_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "products" (
	"id" serial NOT NULL,
	"name" TEXT NOT NULL,
	"price" integer NOT NULL,
	"image" TEXT NOT NULL,
	"category_id" integer NOT NULL,
	"size_id" integer NOT NULL,
	"stock" integer NOT NULL,
	CONSTRAINT "products_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "pics" (
	"id" serial NOT NULL,
	"product_id" integer NOT NULL,
	"image" TEXT NOT NULL,
	CONSTRAINT "pics_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "categories" (
	"id" serial NOT NULL,
	"name" TEXT NOT NULL UNIQUE,
	CONSTRAINT "categories_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "sizes" (
	"id" serial NOT NULL,
	"name" TEXT NOT NULL UNIQUE,
	CONSTRAINT "sizes_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "sales" (
	"id" serial NOT NULL,
	"user_id" integer NOT NULL,
	"status" TEXT NOT NULL DEFAULT 'created',
	"value" bigint NOT NULL,
	"date" TIMESTAMP NOT NULL DEFAULT 'now()',
	"adress_id" integer NOT NULL,
	CONSTRAINT "sales_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "product_sold" (
	"id" serial,
	"product_id" integer NOT NULL,
	"sales_id" integer NOT NULL,
	"quantity" integer NOT NULL DEFAULT '1',
	CONSTRAINT "product_sold_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "adresses" (
	"id" serial NOT NULL,
	"user_id" integer NOT NULL,
	"street" TEXT NOT NULL,
	"number" TEXT NOT NULL,
	"reference" TEXT,
	"cep" varchar(8) NOT NULL,
	CONSTRAINT "adresses_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);


ALTER TABLE "products" ADD CONSTRAINT "products_fk0" FOREIGN KEY ("category_id") REFERENCES "categories"("id");
ALTER TABLE "products" ADD CONSTRAINT "products_fk1" FOREIGN KEY ("size_id") REFERENCES "sizes"("id");
ALTER TABLE "pics" ADD CONSTRAINT "pics_fk0" FOREIGN KEY ("product_id") REFERENCES "products"("id");
ALTER TABLE "sales" ADD CONSTRAINT "sales_fk0" FOREIGN KEY ("user_id") REFERENCES "users"("id");
ALTER TABLE "sales" ADD CONSTRAINT "sales_fk1" FOREIGN KEY ("adress_id") REFERENCES "adresses"("id");
ALTER TABLE "product_sold" ADD CONSTRAINT "product_sold_fk0" FOREIGN KEY ("product_id") REFERENCES "products"("id");
ALTER TABLE "product_sold" ADD CONSTRAINT "product_sold_fk1" FOREIGN KEY ("sales_id") REFERENCES "sales"("id");
ALTER TABLE "adresses" ADD CONSTRAINT "adresses_fk0" FOREIGN KEY ("user_id") REFERENCES "users"("id");

-- ALTER TABLE "products" ADD CONSTRAINT "products_fk0" FOREIGN KEY ("category_id") REFERENCES "categories"("id");
-- ALTER TABLE "products" ADD CONSTRAINT "products_fk1" FOREIGN KEY ("size_id") REFERENCES "sizes"("id");
-- ALTER TABLE "pics" ADD CONSTRAINT "pics_fk0" FOREIGN KEY ("product_id") REFERENCES "products"("id");
-- ALTER TABLE "sales" ADD CONSTRAINT "sales_fk0" FOREIGN KEY ("user_id") REFERENCES "users"("id");
-- ALTER TABLE "sales" ADD CONSTRAINT "sales_fk1" FOREIGN KEY ("adress_id") REFERENCES "adresses"("id");
-- ALTER TABLE "product_sold" ADD CONSTRAINT "product_sold_fk0" FOREIGN KEY ("product_id") REFERENCES "products"("id");
-- ALTER TABLE "product_sold" ADD CONSTRAINT "product_sold_fk1" FOREIGN KEY ("sales_id") REFERENCES "sales"("id");
-- ALTER TABLE "adresses" ADD CONSTRAINT "adresses_fk0" FOREIGN KEY ("user_id") REFERENCES "users"("id");






