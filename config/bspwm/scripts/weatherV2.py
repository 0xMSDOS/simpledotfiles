import requests as re
import argparse

def get_weather(city):
    url="https://api.openweathermap.org/data/2.5/weather?q={}&appid=0e945a5824d9d45a49676f1d74a03ff0&units=metric".format(city)
    response = re.get(url)
    data = response.json()
    return data

def get_Icon(icon_code):
    icons = {
            "01d": "",
            "01n": "",
            "02d": "",
            "02n": "",
            "03d": "󰖐",
            "03n": "",
            "04d": "",
            "04n": "",
            "09d": "󰖗",
            "09n": "󰖗",
            "10d": "",
            "10n": "",
            "11d": "󰼲",
            "11n": "",
            "13d": "",
            "13n": "",
            "50d": "",
            "50n": ""
            }
    return icons.get(icon_code)

def main():
    parser=argparse.ArgumentParser(description="Weather Controller")
    parser.add_argument("--temp", help="Shows the temperature")
    parser.add_argument("--icon", help="Shows the icon temp")
    args=parser.parse_args()

    if args.temp:
        data =  get_weather(args.temp)
        temperature= data["main"]["temp"]
        tempR=round(temperature)
        print(tempR)

    if args.icon:
        data = get_weather(args.icon)
        icon_code = data["weather"][0]["icon"]
        icon_desc = get_Icon(icon_code)
        print (icon_desc)

    if not (args.temp or args.icon):
        print ("Option no valid")


if __name__== "__main__":
    main()
