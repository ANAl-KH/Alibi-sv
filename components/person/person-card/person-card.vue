<template>
	<view class="g-person">
		<view class="u-location-card" v-for="(item,index) in datalist" :key='item.times'  @tap="handlerClickCard(item)" v-if="datalist.length>0">
			<view>
				<view class="u-card-time">{{getLocalTimes(item.times)}}</view>
				<view class="u-card-address">{{item.address.city+item.address.district+item.address.street+item.address.streetNum}}</view>
			</view>
			<u-icon name="arrow-rightward"></u-icon>
		</view>
		<u-empty text="您暂无位置信息哦" mode="list" v-else></u-empty>
	</view>
</template>

<script>
	export default {
		data() {
			return {

			}
		},
		props: {
			datalist: {
				type: Array,
				required: true,
			}
		},
		methods: {
			getLocalTimes(times) {
				return new Date(times).toLocaleString()
			},
			handlerClickCard(item){
				this.$emit('tapCard',item)
			}
		}
	}
</script>

<style scoped lang="scss">
	.g-person {
		min-height: 100%vh;
		background-color: #f5f5f5;
		width: 100%;
		display: flex;
		flex-direction: column;
		align-items: center;
		padding: 10px;

		.u-location-card {
			display: flex;
			align-items: center;
			justify-content: space-between;
			background-color: #FFFFFF;
			width: 100%;
			margin: 10px;
			box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
			border-radius: 5px;
			transition: all .3s;
			padding: 15px;

			&:active {
				transform: scale3d(1.05, 1.1, 1.1);
			}

			.home-address {
				text-overflow: -o-ellipsis-lastline;
				overflow: hidden;
				text-overflow: ellipsis;
				display: -webkit-box;
				line-clamp: 2;
			}
			
			.u-card-time{
				color: #82848a;
				font-size: 50rpx;
			}
		}
	}
</style>
