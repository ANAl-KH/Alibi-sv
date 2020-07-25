<template>
	<view class="g-person-detail">
		<view class="m-person-detail-title">
			<view class="u-title-des">{{getLocalTimes(detail.times)}}您的位置:</view>
			<view class="u-title-title">{{detail.address.city+detail.address.district+detail.address.street+detail.address.streetNum}}</view>
		</view>
		<u-divider class="u-detail-divider"></u-divider>
		<view class="m-icon-list">
			<view class="m-icon-title">
				<u-icon name="order"></u-icon>
				<text class="u-des">原始信息</text>
			</view>
			<u-grid :col="3" class="u-">
				<u-grid-item>
					<u-icon name="minus" :size="46"></u-icon>
					<view class="grid-text">海拔</view>
					<text>{{detail.altitude}}米</text>
				</u-grid-item>
				<u-grid-item>
					<u-icon name="map" :size="46"></u-icon>
					<view class="grid-text">经度</view>
					<text>{{detail.longitude}}</text>
				</u-grid-item>
				<u-grid-item>
					<u-icon name="map-fill" :size="46"></u-icon>
					<view class="grid-text">纬度</view>
					<text>{{detail.latitude}}</text>
				</u-grid-item>
			</u-grid>
			<view class="m-icon-title">
				<u-icon name="lock-opened-fill"></u-icon>
				<text class="u-des">验证相关信息（长按复制HASH及TXID）</text>
			</view>
			<view class="m-secrty">
				<view class="m-secrty-info" @longtap="paste(detail.hash)">
					<text class="u-label">HASH: </text>
					<text class="u-content">{{detail.hash}}</text>
				</view>
				<view class="m-secrty-info" @longtap="paste(detail.txid)">
					<text class="u-label">TXID: </text>
					<text class="u-content">{{detail.txid}}</text>
				</view>
			</view>
		</view>
		<view class="u-detail-canvas-view">
			<canvas calss="u-detail-canvas" canvas-id="qrcode" style="width: 215px;height: 215px;" @longtap="saveImage" />
		</view>
		<u-toast ref="uToast" />
	</view>
</template>

<script>
	import uQRCode from '../../js_sdk/Sansnn-uQRCode/uqrcode.js'
	export default {
		data() {
			return {
				detail: new Object(),
				temPath: '',
				showModel: false,
				url: ''
			}
		},
		onLoad(option) {
			console.log(option)
			//获取storege里面的数据
			this.detail = uni.getStorageSync('LocationDataList').find(txid => {
				return txid = option.txid
			})
			console.log(this.detail)
			this.url = `https://www.whatsonchain.com/tx/${this.detail.txid}`
			this.make();
		},
		methods: {
			/**
			 * 方法说明 保存二维码
			 * @param 
			 * Date 2020-7-21 00:27:55
			 */
			saveImage() {
				let _this = this;
				//绘画转图片
				uni.canvasToTempFilePath({
					canvasId: 'qrcode',
					success: function(res) {
						//调用本地接口，保存到相册
						uni.saveImageToPhotosAlbum({
							filePath: res.tempFilePath
						})
						_this.$refs.uToast.show({
							title: '图片保存成功',
							type: 'success',
						})
					}
				})
			},
			/**
			 * 方法说明 长按复制文本
			 * @param 
			 * Date 2020-7-21 00:29:16
			 */
			paste(value) {
				uni.setClipboardData({
					data: value
				});
			},

			/**
			 * 方法说明 获取当前时间
			 * @param 
			 * Date 2020-7-21 00:29:16
			 */
			getLocalTimes(times) {
				console.log(times)
				return new Date(times).toLocaleString()
			},

			/**
			 * 方法说明 生成二维码
			 * @param 
			 * Date 2020-7-21 00:29:16
			 */
			make() {
				let _this = this;
				let x = `https://www.whatsonchain.com/tx/${_this.detail.txid}`
				console.log(x)
				uQRCode.make({
					canvasId: 'qrcode',
					componentInstance: this,
					text: `https://www.whatsonchain.com/tx/${_this.detail.txid}`,
					size: 215,
					margin: 10,
					backgroundColor: '#ffffff',
					foregroundColor: '#000000',
					fileType: 'jpg',
					correctLevel: uQRCode.defaults.correctLevel,
				})
			}
		}
	}
</script>

<style scoped lang="scss">
	.g-person-detail {
		background-size: cover;
		display: flex;
		flex-direction: column;
		padding: 50rpx 10rpx;

		.m-person-detail-title {
			display: flex;
			flex-direction: column;
			align-items: center;

			.u-title-des {
				font-size: 40rpx;
			}

			.u-title-title {
				margin-top: 20rpx;
				font-size: 40rpx;
				color: #82848a;
			}
		}

		.u-detail-divider {
			margin-top: 40rpx;
		}

		.m-icon-list {
			width: 100%;
			margin-top: 30rpx;

			.m-icon-title {
				margin-top: 20rpx;
				width: 100%;
				display: flex;
				align-items: center;
				padding-left: 20rpx;

				.u-des {
					margin-left: 20rpx;
				}
			}
		}

		.trasform {
			transition: all .3s;

			&:active {
				transform: scale3d(1.02, 1.1, 1.1);
			}
		}

		.m-secrty {
			padding: 10rpx;
			word-break: break-word; //换行模式
			overflow: hidden;

			.m-secrty-info {
				margin-top: 50px;
				@extend .trasform;

				.u-label {
					font-size: 30rpx;
					font-weight: 500;

				}
			}

		}

		.u-detail-canvas-view {
			width: 100%;
			display: flex;
			justify-content: center;
			@extend .trasform;

			&:active {
				transform: scale3d(1.1, 1.1, 1.1);
			}


		}
	}
</style>
