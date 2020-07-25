<script>
	export default {
		onLaunch: function() {
			let LocationDataList  = uni.getStorageSync('LocationDataList')
			if(!LocationDataList){
				uni.setStorageSync('LocationDataList',[])
			}
			console.log('App Launch')
			
		},
		onShow: function() {
			console.log('App Show')
		},
		onHide: function() {
			console.log('App Hide')
		},
		
	}
</script>

<style lang="scss">
	/*每个页面公共css */
	@import "uview-ui/index.scss";
</style>
