while{MissionGoMinor == 1} do {
    _MainMarker75 = createMarker["MainMarker75", MCoords];
    _MainMarker75 setMarkerColor "ColorRed";
    _MainMarker75 setMarkerShape "ELLIPSE";
    _MainMarker75 setMarkerBrush "Grid";
    _MainMarker75 setMarkerAlpha 0.75;
    _MainMarker75 setMarkerSize [150,150];
sleep 25;
    deleteMarker _MainMarker75;
};
