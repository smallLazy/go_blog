package libs

import (
	"crypto/md5"
	"fmt"
	"log"
	"reflect"
	"strings"
)

// ToInt64
func ToInt64(value interface{}) (d int64, err error) {
	val := reflect.ValueOf(value)
	switch value.(type) {
	case int, int8, int16, int32, int64:
		d = val.Int()
	case uint, uint8, uint16, uint32, uint64:
		d = int64(val.Uint())
	default:
		err = fmt.Errorf("ToInt64 need numeric not `%T`", value)
	}
	return
}

func Index(s, sep string) int {
	return strings.Index(s, sep)
}

func Split(s, sep string) []string {
	return strings.Split(s, sep)
}

func ContainsStr(s, sep string, start int) string {
	index := Index(s, sep)
	var r = []rune(s)
	length := len(r)
	// log.Println(index, length)

	if start < 0 || index > length || start > index {
		return ""
	}

	if start == 0 && index == length {
		return s
	}

	var substring = ""
	subMap := make(map[int]string)
	j := 0
	for i := start; i < length; i++ {
		if string(r[i]) == "/" {
			j = 1
			continue
		}
		subMap[j] += string(r[i])

	}
	log.Println("123")
	return substring

	// return string(r[start:index])

	// return strings.Contains(s, substring)
}

// 密码加盐加密
func Encrypt(password string) string {
	newpas := "golang" + password + "微懒"
	data := []byte(newpas)
	has := md5.Sum(data)
	md5str := fmt.Sprintf("%x", has)
	return md5str
}
