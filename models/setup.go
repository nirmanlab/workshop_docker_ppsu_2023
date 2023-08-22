package models

import (
	"gorm.io/driver/postgres"
	"gorm.io/gorm"
)

var DB *gorm.DB

func ConnectDatabase() {
	// dsn := "host=192.168.29.49 user=postgres dbname=demo_blog port=5432 sslmode=disable timezone=Asia/Kolkata"
	connString := "postgres://postgres:ppsu-demo@192.168.29.49:5432/demo_blog"
	database, err := gorm.Open(postgres.Open(connString), &gorm.Config{})

	if err != nil {
		panic("Failed to connect to database! " + err.Error())
	}

	database.AutoMigrate(&Post{})

	DB = database
}
