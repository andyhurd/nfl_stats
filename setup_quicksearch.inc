
    
    <script>
	
		// set up nav_search element to filter teams
		$('input#nav_search').quicksearch('table tbody tr', {
			selector: 'td'
		});
		
		$('input#nav_search').keypress(function(e) {
			var code = e.which;
			if (code == 13) {
				e.preventDefault();
				
				// click on the first row
				var row = $('table tbody tr:visible:first td').click();
			}
		});
	</script>