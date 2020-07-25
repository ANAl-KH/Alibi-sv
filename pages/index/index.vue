<template>
	<view class="g-location">
		<view class="m-location">
			<text>当前海拔：{{hb}}</text>
			<text>当前经度：{{lon}}</text>
			<text>当前纬度：{{lat}}</text>
		</view>
		<u-button type="primary" :ripple="true" @click="getLocation" :loading="isGetLocation">记录当前位置</u-button>
		<view class="u-check">
			<text>开启自动上传</text>
			<switch @change="isChangeAuto" />
			<text>开启自动上传后，每小时将自动上链位置信息</text>
		</view>
	</view>
</template>

<script>
	const crypto = require('crypto');
	export default {
		components: {},
		data() {
			return {
				title: 'Hello',
				location: new Object(),
				hb: '未获取',
				lon: '未获取',
				lat: '未获取',
				autoUpLoad: false,
				isGetLocation: false,

			}
		},
		onLoad() {
			this.getLocationAddress()
		},

		methods: {
			/**
			 * 方法说明 获取当前位置信息
			 * @param 
			 * Date 2020-7-19 14:23:27
			 */
			async getLocationAddress() {
				this.isGetLocation = true
				let [error, data] = await uni.getLocation({
					type: 'wgs84',
					altitude: true,
					geocode: true,
				})
				console.log(data)
				this.location = data
				this.hb = Math.trunc(data.altitude) //海拔
				this.lon = data.longitude.toFixed(2) //经度
				this.lat = data.latitude.toFixed(2) //纬度
				this.isGetLocation = false
			},
			getRandomSalt() {
				// 取随机数
				const randomSalt = Math.random().toString().slice(2, 8);
				return randomSalt;
			},
			/**
			 * 方法说明 上链及存储
			 * @param 
			 * Date 2020-7-19 14:51:27
			 */
			async getLocation() {
				let time = new Date().getTime() //获取当前时间戳
				//计算hash
				let randomNum = this.getRandomSalt()
				const hash = crypto.createHmac('sha256', randomNum);
				hash.update(this.lon + this.lat + time);
				let result = hash.digest('hex');
				//本地存储
				let locationData = {
					...this.location,
					altitude: this.hb,
					longitude: this.lon,
					latitude: this.lat,
					times: time,
					random: randomNum,
					hash: result
				}
				//上链
				let str = JSON.stringify(locationData);
				let [nullData, txidData] = await uni.request({
					url: 'https://www.ddpurse.com/platform/openapi/v2/push_chain_data',
					dataType: 'json',
					method: 'POST',
					data: {
						'coin_type': 'BSV',
						'data': str,
						"data_type": 0
					},
					header: {
						'appid': '70083476d49f695d62ba67e707d5b6eb', //自定义请求头信息
						'appsecret': 'ac75ab1021b4d2a874314cc084e28635'
					},
				});
				console.log(txidData);
				locationData.txid = txidData.data.data.tx_id
				//本地存储
				let testData = uni.getStorageSync('LocationDataList')
				let pushData = [locationData, ...testData]
				uni.setStorageSync('LocationDataList', pushData)
				console.log(uni.getStorageSync('LocationDataList'))
			},
			/**
			 * 方法说明 改变自动获取位置上链
			 * @param 
			 * Date 2020-7-19 22:03:13
			 */
			async isChangeAuto(res) {
				this.autoUpLoad = res.target.value
				//绑定在原型链上的是否自动上传
				this.isAutoUpLoad = this.autoUpLoad;
				if (this.isAutoUpLoad) {
					this.isAutoFun = setInterval(() => {
						this.getLocation();
						console.log('start')
					}, 10000)
				}
				else{
					clearInterval(this.isAutoFun)
				}

				console.log(this.autoUpLoad)
			}
		}
	}
</script>

<style scoped lang="scss">
	.g-location {
		width: 100%;
		height: 100vh;
		display: flex;
		flex-direction: column;
		justify-content: space-around;
		align-items: center;

		.m-location {
			display: flex;
			flex-direction: column;
		}

		.u-location-button {
			width: auto;
			height: 100rpx;
			box-shadow: #2C405A;
			border: none;
		}

		.u-check {
			display: flex;
			flex-direction: column;
			justify-content: center;
			align-items: center;
		}
	}
</style>
