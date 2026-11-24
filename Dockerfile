# Baked ComfyUI image for Salad: official comfyui-api base + model weights baked in.
# Models are downloaded from HuggingFace during the GitHub Actions build (never stored in git).
# ARG COMFYUI_DIR is discovered by the workflow's probe job (the base image's ComfyUI root).
ARG BASE_IMAGE=ghcr.io/saladtechnologies/comfyui-api:comfy0.7.0-api1.16.1-torch2.8.0-cuda12.8-runtime
FROM ${BASE_IMAGE}
ARG COMFYUI_DIR=/comfyui

# Qwen-Image-Edit 2509 (FP8 set, ~30GB)
ADD https://huggingface.co/Comfy-Org/Qwen-Image-Edit_ComfyUI/resolve/main/split_files/diffusion_models/qwen_image_edit_2509_fp8_e4m3fn.safetensors ${COMFYUI_DIR}/models/diffusion_models/qwen_image_edit_2509_fp8_e4m3fn.safetensors
ADD https://huggingface.co/Comfy-Org/Qwen-Image_ComfyUI/resolve/main/split_files/text_encoders/qwen_2.5_vl_7b_fp8_scaled.safetensors          ${COMFYUI_DIR}/models/text_encoders/qwen_2.5_vl_7b_fp8_scaled.safetensors
ADD https://huggingface.co/Comfy-Org/Qwen-Image_ComfyUI/resolve/main/split_files/vae/qwen_image_vae.safetensors                               ${COMFYUI_DIR}/models/vae/qwen_image_vae.safetensors

# Illustrious XL v2.0 (~7GB)
ADD https://huggingface.co/OnomaAIResearch/Illustrious-XL-v2.0/resolve/main/Illustrious-XL-v2.0.safetensors ${COMFYUI_DIR}/models/checkpoints/Illustrious-XL-v2.0.safetensors
