while{MissionGo == 1} do {
    _MainMarker = createMarker ["MainMarker", Ccoords];
    _MainMarker setMarkerColor "ColorRed";
    _MainMarker setMarkerShape "ELLIPSE";
    _MainMarker setMarkerBrush "Grid";
    _MainMarker setMarkerAlpha 0.75;
    _MainMarker setMarkerSize [250,250];
sleep 25;
	deleteMarker _MainMarker;
};
