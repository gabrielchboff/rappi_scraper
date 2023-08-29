import geocoder
from dataclasses import dataclass

from python.utils.config import CEP_TOKEN


@dataclass
class Location:
    locality: str

    @property
    def cordinates(self) -> list:
        return geocoder.arcgis(self.locality).latlng


@dataclass
class Address:
    cordinates: list

    @property
    def locality(self) -> str:
        url = "https://www.cepaberto.com/api/v3/nearest"
        headers = {'Authorization': f'Token token = {CEP_TOKEN}}
        params = {'lat': -20.55, 'lng': -43.63}
        response = requests.get(url, headers=headers, params=params)
        return response.json()
